package com.javaweb.service.impl;

import com.javaweb.converter.BuildingEditDTOConverter;
import com.javaweb.converter.BuildingEntityConverter;
import com.javaweb.converter.BuildingSearchResponseConverter;
import com.javaweb.entity.AssignmentBuildingEntity;
import com.javaweb.entity.BuildingEntity;
import com.javaweb.entity.RentAreaEntity;
import com.javaweb.entity.UserEntity;
import com.javaweb.model.dto.BuildingEditDTO;
import com.javaweb.model.request.BuildingSearchRequest;
import com.javaweb.model.response.BuildingSearchResponse;
import com.javaweb.model.response.ResponseDTO;
import com.javaweb.model.response.StaffResponseDTO;
import com.javaweb.repository.RentAreaRepository;
import com.javaweb.repository.UserRepository;
import com.javaweb.repository.BuildingRepository;
import com.javaweb.service.BuildingService;
import com.javaweb.utils.RequestUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

@Service
public class BuildingServiceImpl implements BuildingService {
    private static final String UPLOAD_DIR = "D:/SpringBoot/uploads/";
    @Autowired
    private BuildingRepository buildingRepository;
    @Autowired
    private UserRepository userRepository;
    @Autowired
    private BuildingSearchResponseConverter buildingSearchResponseConverter;
    @Autowired
    private BuildingEditDTOConverter buildingEditDTOConverter;
    @Autowired
    private BuildingEntityConverter buildingEntityConverter;
    @Autowired
    private RentAreaRepository rentAreaRepository;

    @Override
    public ResponseDTO listStaffs(long buildingId) {
        BuildingEntity building = buildingRepository.findById(buildingId).get(); // tim kiem toa nha
        List<UserEntity> staffs = userRepository.findByStatusAndRoles_Code(1,"STAFF"); // lay het nhan vien
        Set<Long> assignedStaffIds = building.getUserEntities().stream().map(UserEntity::getId).collect(Collectors.toSet()); // lay nhan vien dc phan cong

        List<StaffResponseDTO> staffResponseDTOs = new ArrayList<>();
        ResponseDTO responseDTO = new ResponseDTO();
        for(UserEntity item : staffs){
            StaffResponseDTO staffResponseDTO = new StaffResponseDTO();
            staffResponseDTO.setFullName(item.getFullName());
            staffResponseDTO.setStaffId(item.getId());
            if(assignedStaffIds.contains(item.getId())){
                staffResponseDTO.setChecked("checked");
            }
            else{
                staffResponseDTO.setChecked("");
            }
            staffResponseDTOs.add(staffResponseDTO);
        }

        responseDTO.setData(staffResponseDTOs);
        responseDTO.setMessage("success");
        return responseDTO;
    }

    @Override
    public List<BuildingSearchResponse> listBuildings(BuildingSearchRequest buildingSearchRequest) {
        buildingSearchRequest = RequestUtils.normalize(buildingSearchRequest);
        List<BuildingEntity> buildingEntities = buildingRepository.searchComplex(buildingSearchRequest);
        List<BuildingSearchResponse> result = new ArrayList<>();
        for(BuildingEntity buildingEntity : buildingEntities){
            BuildingSearchResponse tmp = buildingSearchResponseConverter.toBuildingDTO(buildingEntity);
            result.add(tmp);
        }
        return result;
    }

    @Transactional
    @Override
    public BuildingEditDTO buildingEdit(BuildingEditDTO buildingEditDTO) {
        BuildingEntity buildingEntity;
        if(buildingEditDTO.getId() != null){
            buildingEntity = buildingRepository.findById(buildingEditDTO.getId()).get();
        }
        else{
            buildingEntity = new BuildingEntity();
        }
        buildingEditDTOConverter.updateEntityFromDTO(buildingEditDTO,buildingEntity);
        BuildingEntity buildingEntitySave = buildingRepository.save(buildingEntity);

        // Neu DTO gui rentArea
        if(buildingEditDTO.getRentArea() != null && !buildingEditDTO.getRentArea().isEmpty()){
            rentAreaRepository.deleteByBuilding_Id(buildingEntitySave.getId());
            List<Long> rentArea = Arrays.stream(buildingEditDTO.getRentArea().split(",")).map(String::trim).filter(s -> !s.isEmpty()).map(Long::parseLong).collect(Collectors.toList());
            for(Long value : rentArea){
                RentAreaEntity rentAreaEntity = new RentAreaEntity();
                rentAreaEntity.setBuilding(buildingEntitySave);
                rentAreaEntity.setValue(value);
                rentAreaRepository.save(rentAreaEntity);
            }
        }

        BuildingEditDTO buildingEditDTOResponse = buildingEntityConverter.buildingEntityToBuildingEditDTO(buildingEntitySave);
        return buildingEditDTOResponse;
    }

    @Override
    public BuildingEditDTO findBuildingEdit(Long id) {
        BuildingEntity buildingEntity = buildingRepository.findById(id).get();
        BuildingEditDTO buildingEditDTO =  buildingEntityConverter.buildingEntityToBuildingEditDTO(buildingEntity);
        return buildingEditDTO;
    }

    @Transactional
    @Override
    public void deleteBuildings(List<Long> ids) {
        List<BuildingEntity> buildingEntities = buildingRepository.findAllById(ids);
        for(BuildingEntity item : buildingEntities){
            item.getUserEntities().clear();
        }
        buildingRepository.deleteAllById(ids);
    }

    @Transactional
    @Override
    public void assignmentStaff(Long buildingId, List<Long> staffIds) {
        // tim building
        BuildingEntity buildingEntity = buildingRepository.findById(buildingId).get();
        // tim ds staff
        List<UserEntity> userList = userRepository.findAllById(staffIds);
        // clear ds staff cu va add staff moi
        buildingEntity.getUserEntities().clear();
        buildingEntity.getUserEntities().addAll(userList);
        buildingRepository.save(buildingEntity);
    }

    @Override
    public Page<BuildingSearchResponse> searchBuildings(String name,Pageable pageable) {
        Page<BuildingEntity> pageEntities = buildingRepository.findByNameContaining(
                name != null ? name : "",
                pageable
        );
        Page<BuildingSearchResponse> pageDTO = pageEntities.map(entity -> buildingSearchResponseConverter.toBuildingDTO(entity));
        return pageDTO;
    }

    @Override
    public String storeFile(MultipartFile file, Long buildingId) {
        try {
            // Tạo tên file duy nhất
            String fileName = System.currentTimeMillis() + "_" + file.getOriginalFilename();

            // Đảm bảo thư mục tồn tại
            File uploadDir = new File(UPLOAD_DIR);
            if (!uploadDir.exists()) {
                uploadDir.mkdirs();  // nếu chưa có thì tạo thư mục
            }

            // Tạo file vật lý và copy dữ liệu từ MultipartFile vào
            File destinationFile = new File(uploadDir, fileName);
            file.transferTo(destinationFile);

            // Tạo đường dẫn (URL) cho FE sử dụng (phải đồng bộ với WebMvcConfig)
            String fileUrl = "/uploads/" + fileName;

            // Lưu path vào DB
            BuildingEntity buildingEntity = buildingRepository.findById(buildingId)
                    .orElseThrow(() -> new RuntimeException("Building not found!!"));
            buildingEntity.setImagePath(fileUrl);

            // Lưu lại entity
            buildingRepository.save(buildingEntity);

            // Trả về URL để FE hiển thị ảnh luôn
            return fileUrl;
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException("Upload file failed!");
        }
    }

}
