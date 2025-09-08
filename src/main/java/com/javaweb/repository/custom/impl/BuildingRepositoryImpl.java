package com.javaweb.repository.custom.impl;

import com.javaweb.api.criteriaAPI.Criteria;
import com.javaweb.entity.AssignmentBuildingEntity;
import com.javaweb.entity.BuildingEntity;
import com.javaweb.entity.RentAreaEntity;
import com.javaweb.model.request.BuildingSearchRequest;
import com.javaweb.repository.custom.BuildingRepositoryCustom;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.persistence.criteria.*;
import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

@Repository
public class BuildingRepositoryImpl implements BuildingRepositoryCustom {

    @PersistenceContext
    private EntityManager entityManager;

    public static void joinTable(BuildingSearchRequest request, Criteria<BuildingEntity> criteria) {
        if(request.getStaffId() != null){
            Join<BuildingEntity, AssignmentBuildingEntity> ab = criteria.getRoot().join("assignmentBuildingEntities");
            criteria.getRoot().alias("b");
            Long staffId = request.getStaffId();
            criteria.getPredicates().add(criteria.getCriteriaBuilder().equal(ab.get("staff").get("id"), staffId));
        }
        if(request.getAreaFrom() != null || request.getAreaTo() != null){
            Join<BuildingEntity, RentAreaEntity> ra = criteria.getRoot().join("rentAreas");
            criteria.getRoot().alias("b");

            Long areaFrom = request.getAreaFrom();
            Long areaTo = request.getAreaTo();
            if(areaFrom != null || areaTo != null){
                if(areaFrom != null){
                    criteria.getPredicates().add(criteria.getCriteriaBuilder().greaterThanOrEqualTo(ra.get("value"), areaFrom));
                }
                if(areaTo != null){
                    criteria.getPredicates().add(criteria.getCriteriaBuilder().lessThanOrEqualTo(ra.get("value"), areaTo));
                }
            }
        }
    }

    public static void queryNormal(BuildingSearchRequest request, Criteria<BuildingEntity> criteria) {
        try{
            Field[] fields = BuildingSearchRequest.class.getDeclaredFields();
            for (Field item : fields) {
                item.setAccessible(true);
                String fieldName = item.getName();
                if(!fieldName.equals("staffId") && !fieldName.equals("typeCode") && !fieldName.startsWith("area") && !fieldName.startsWith("rentPrice")){
                    Object value = item.get(request);
                    if(value != null){
                       String typeName = item.getType().getName();
                       if(typeName.equals("java.lang.Long") || typeName.equals("java.lang.Integer") || typeName.equals("java.lang.Double")){
                           criteria.getPredicates().add(criteria.getCriteriaBuilder().equal(criteria.getRoot().get(fieldName), value));
                       }
                       if(typeName.equals("java.lang.String")){
                           criteria.getPredicates().add(criteria.getCriteriaBuilder().like(criteria.getRoot().get(fieldName), "%"+value+"%"));
                       }
                    }
                }
            }
        }catch(Exception e){
            e.printStackTrace();
        }
    }

    public static void querySpecial(BuildingSearchRequest request, Criteria<BuildingEntity> criteria) {
        Long rentPriceFrom = request.getRentPriceFrom();
        Long rentPriceTo = request.getRentPriceTo();
        if(rentPriceFrom != null || rentPriceTo != null){
            if(rentPriceFrom != null){
                criteria.getPredicates().add(criteria.getCriteriaBuilder().greaterThanOrEqualTo(criteria.getRoot().get("rentPrice"), rentPriceFrom));
            }
            if(rentPriceTo != null){
                criteria.getPredicates().add(criteria.getCriteriaBuilder().lessThanOrEqualTo(criteria.getRoot().get("rentPrice"), rentPriceTo));
            }
        }

        List<String> typeCode = request.getTypeCode();
        if(typeCode != null){
            List<Predicate> orPredicates = new ArrayList<>();
            for(String type : typeCode){
                orPredicates.add(criteria.getCriteriaBuilder().like(criteria.getRoot().get("typeCode"), "%"+type+"%"));
            }
            Predicate resultOr = criteria.getCriteriaBuilder().or(orPredicates.toArray(new Predicate[0]));
            criteria.getPredicates().add(resultOr);
        }
    }

    @Override
    public List<BuildingEntity> searchComplex(BuildingSearchRequest request) {
        CriteriaBuilder criteriaBuilder = entityManager.getCriteriaBuilder();
        CriteriaQuery<BuildingEntity> criteriaQuery = criteriaBuilder.createQuery(BuildingEntity.class);
        Root<BuildingEntity> root = criteriaQuery.from(BuildingEntity.class);

        Criteria<BuildingEntity> criteria = new Criteria<>(criteriaBuilder, criteriaQuery, root);
        joinTable(request, criteria);
        queryNormal(request, criteria);
        querySpecial(request, criteria);
        criteriaQuery.select(root).where(criteria.getPredicates().toArray(new Predicate[0]));

        return entityManager.createQuery(criteriaQuery).getResultList();
    }
}
