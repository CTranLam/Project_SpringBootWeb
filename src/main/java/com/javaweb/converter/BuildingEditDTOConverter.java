package com.javaweb.converter;

import com.javaweb.entity.BuildingEntity;
import com.javaweb.model.dto.BuildingEditDTO;
import org.springframework.stereotype.Component;

@Component
public class BuildingEditDTOConverter {
    public BuildingEntity buildingEditDTOToEntity(BuildingEditDTO buildingEditDTO){
        BuildingEntity buildingEntity = new BuildingEntity();
        return buildingEntity;
    }
}
