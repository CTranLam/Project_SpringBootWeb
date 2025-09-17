package com.javaweb.repository;


import com.javaweb.entity.AssignmentBuildingEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

public interface AssignmentBuildingRepository extends JpaRepository<AssignmentBuildingEntity,Long> {

    @Modifying
    @Transactional
    @Query("DELETE FROM AssignmentBuildingEntity a WHERE a.building.id = :buildingId")
    void deleteByBuildingId(@Param("buildingId") Long buildingId);

    @Modifying
    @Transactional
    @Query("DELETE FROM AssignmentBuildingEntity a WHERE a.building.id IN :buildingIds")
    void deleteByBuildingIds(@Param("buildingIds") List<Long> buildingIds);
}
