package com.javaweb.converter;

import com.javaweb.entity.BuildingEntity;
import com.javaweb.model.dto.BuildingEditDTO;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.lang.reflect.Field;
import java.util.List;
import java.util.stream.Collectors;

@Component
public class BuildingEditDTOConverter {
    @Autowired
    private ModelMapper modelMapper;

    public BuildingEntity buildingEditDTOToEntity(BuildingEditDTO buildingEditDTO){
        BuildingEntity buildingEntity = modelMapper.map(buildingEditDTO, BuildingEntity.class);
        List<String> listTypeCode = buildingEditDTO.getTypeCode();
        String type = listTypeCode.stream().map(it -> it.toString()).collect(Collectors.joining(","));
        buildingEntity.setTypeCode(type);
        return buildingEntity;
    }

    public void updateEntityFromDTO(BuildingEditDTO buildingEditDTO, BuildingEntity buildingEntity){
        try{
            Field[] fields = BuildingEditDTO.class.getDeclaredFields();
            for(Field field : fields){
                field.setAccessible(true);
                String fieldName = field.getName();
                if(!fieldName.equals("typeCode") && !fieldName.equals("id") && !fieldName.equals("rentArea")){
                    Object fieldValue = field.get(buildingEditDTO);
                    if(fieldValue != null){
                        try {
                            Field entityField = BuildingEntity.class.getDeclaredField(fieldName);
                            entityField.setAccessible(true);
                            entityField.set(buildingEntity, fieldValue);
                        }catch (NoSuchFieldException e){
                            e.printStackTrace();
                        }
                    }
                }
            }
            List<String> listTypeCode = buildingEditDTO.getTypeCode();
            if(listTypeCode != null && !listTypeCode.isEmpty()){
                String type = String.join(",", listTypeCode); // join 1 list string
                buildingEntity.setTypeCode(type);
            }

        }catch(Exception e){
            e.printStackTrace();
        }
    }
}
