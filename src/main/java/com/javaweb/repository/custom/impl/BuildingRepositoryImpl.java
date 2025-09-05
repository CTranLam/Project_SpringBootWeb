package com.javaweb.repository.custom.impl;

import com.javaweb.entity.BuildingEntity;
import com.javaweb.model.request.BuildingSearchRequest;
import com.javaweb.repository.custom.BuildingRepositoryCustom;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.lang.reflect.Field;
import java.util.List;
import java.util.stream.Collectors;

@Repository
public class BuildingRepositoryImpl implements BuildingRepositoryCustom {

    @PersistenceContext
    private EntityManager entityManager;

    public static void joinTable(BuildingSearchRequest request,StringBuilder jpql){
        Long staffId = request.getStaffId();
        if(staffId!=null){
            jpql.append(" JOIN b.assignmentBuildingEntities abe JOIN abe.staff s ");
        }
    }
    public static void queryNomal(BuildingSearchRequest request,StringBuilder where){
        try{
            Field[] fields = BuildingSearchRequest.class.getDeclaredFields();
            for(Field item :  fields){
                item.setAccessible(true);
                String fieldName = item.getName();
                if( !fieldName.equals("staffId") && !fieldName.equals("typeCode") && !fieldName.startsWith("area") && !fieldName.startsWith("rentPrice")){
                    Object value = item.get(request);
                    if(value != null){
                        if(item.getType().getName().equals("java.lang.Long") || item.getType().getName().equals("java.lang.Integer") || item.getType().getName().equals("java.lang.Double")){
                            where.append(" AND b." + fieldName + " = " + value + " ");
                        }
                        else if(item.getType().getName().equals("java.lang.String")){
                            where.append(" AND b." + fieldName + " Like '%" + value + "%' ");
                        }
                    }
                }
            }
        }catch(Exception e){
            e.printStackTrace();
        }
    }
    public static void querySpecial(BuildingSearchRequest request,StringBuilder where){
        Long staffId = request.getStaffId();
        if(staffId!=null){
            where.append(" And s.id = " + staffId + " ");
        }

        Long areaFrom = request.getAreaFrom();
        Long areaTo = request.getAreaTo();
        if(areaFrom!=null || areaTo!=null){
            where.append(" AND EXISTS (SELECT 1 FROM b.rentAreas as ra WHERE 1 = 1 ");
            if(areaFrom != null) {
                where.append(" AND ra.value >= " + areaFrom);
            }
            if(areaTo != null) {
                where.append(" AND ra.value <= " + areaTo);
            }
            where.append(" ) ");
        }

        Long rentPriceFrom = request.getRentPriceFrom();
        Long rentPriceTo = request.getRentPriceTo();
        if(rentPriceFrom!=null || rentPriceTo!=null){
            if(rentPriceFrom != null) {
                where.append(" AND b.rentPrice >= " + rentPriceFrom);
            }
            if(rentPriceTo != null) {
                where.append(" AND b.rentPrice <= " + rentPriceTo);
            }
        }

        List<String> typeCode = request.getTypeCode();
        if(typeCode != null && !typeCode.isEmpty()){
           where.append(" And ( ");
           String sql = typeCode.stream().map(code -> "b.typeCode Like '%" + code + "%'").collect(Collectors.joining(" OR "));
           where.append(sql);
           where.append(" ) ");
        }
    }
    @Override
    public List<BuildingEntity> searchComplex(BuildingSearchRequest request) {
        StringBuilder jpql = new StringBuilder(" select b from BuildingEntity b ");
        joinTable(request,jpql);
        StringBuilder where = new StringBuilder(" where 1 = 1 ");
        queryNomal(request,where);
        querySpecial(request,where);
        jpql.append(where);
        Query query = entityManager.createQuery(jpql.toString(),BuildingEntity.class);
        return query.getResultList();
    }
}
