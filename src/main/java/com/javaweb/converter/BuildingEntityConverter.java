package com.javaweb.converter;

import com.javaweb.entity.BuildingEntity;
import com.javaweb.model.dto.BuildingEditDTO;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

@Component
public class BuildingEntityConverter {
    @Autowired
    private ModelMapper modelMapper;

    public BuildingEditDTO buildingEntityToBuildingEditDTO(BuildingEntity buildingEntity) {
        BuildingEditDTO buildingEditDTO = modelMapper.map(buildingEntity, BuildingEditDTO.class);
        if (buildingEntity.getTypeCode() != null) {
            buildingEditDTO.setTypeCode(Arrays.stream(buildingEntity.getTypeCode().split(",")).map(String::trim).collect(Collectors.toList()));
        }
        return buildingEditDTO;
    }
}
