package com.javaweb.utils;

import com.javaweb.model.request.BuildingSearchRequest;
import org.springframework.stereotype.Component;

public class RequestUtils {
    private static boolean isEmpty(String str) {
        return str == null || str.trim().isEmpty();
    }

    public static BuildingSearchRequest normalize(BuildingSearchRequest request) {
        if(request==null){
            return null;
        }
        if (isEmpty(request.getName())) request.setName(null);
        if (isEmpty(request.getWard())) request.setWard(null);
        if (isEmpty(request.getStreet())) request.setStreet(null);
        if (isEmpty(request.getDistrict())) request.setDistrict(null);
        if (isEmpty(request.getManagerName())) request.setManagerName(null);
        if (isEmpty(request.getManagerPhone())) request.setManagerPhone(null);
        if (isEmpty(request.getDirection())) request.setDirection(null);

        if (request.getTypeCode() != null && request.getTypeCode().isEmpty()) {
            request.setTypeCode(null);
        }
        return request;
    }
}
