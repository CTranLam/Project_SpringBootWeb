package com.javaweb.repository;

import com.javaweb.entity.RentAreaEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

public interface RentAreaRepository extends JpaRepository<RentAreaEntity,Long> {
    void deleteByBuilding_Id(Long buildingId);

    @Modifying
    @Transactional
    @Query("Delete From RentAreaEntity ra Where ra.building.id in :buildingIds")
    void deleteByBuildingIds(@Param("buildingIds") List<Long> buildingId);

}
