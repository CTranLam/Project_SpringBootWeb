package com.javaweb.service.impl;

import com.javaweb.repository.AssignmentBuildingRepository;
import com.javaweb.service.AssigmentBuildingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.List;

@Service
public class AssignmentBuildingServiceImpl implements AssigmentBuildingService {
    @Autowired
    private AssignmentBuildingRepository assignmentBuildingRepository;

    @Transactional
    @Override
    public void deleteAssignmentBuildings(List<Long> buildingIds) {
        assignmentBuildingRepository.deleteByBuildingIds(buildingIds);
    }
}
