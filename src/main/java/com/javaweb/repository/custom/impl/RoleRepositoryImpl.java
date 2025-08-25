package com.javaweb.repository.custom.impl;

import com.javaweb.entity.RoleEntity;
import com.javaweb.repository.RoleRepository;
import com.javaweb.repository.custom.RoleRepositoryCustom;
import org.springframework.data.domain.Example;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.util.List;
import java.util.Optional;


@Repository
public class RoleRepositoryImpl implements RoleRepositoryCustom {
	@PersistenceContext
	private EntityManager entityManager;


	@Override
	public RoleEntity findOneByCode(String code) {
		String sql = "select * FROM role as r where r.code = '" + code + "'";
		Query query = entityManager.createNativeQuery(sql, RoleEntity.class);
		return (RoleEntity) query.getSingleResult();
	}

}
