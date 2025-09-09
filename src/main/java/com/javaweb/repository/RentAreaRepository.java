package com.javaweb.repository;

import com.javaweb.entity.RentAreaEntity;
import org.springframework.data.jpa.repository.JpaRepository;

public interface RentAreaRepository extends JpaRepository<RentAreaEntity,Long> {
    void deleteByBuilding_Id(Long buildingId);
}
