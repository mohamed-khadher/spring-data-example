package tn.enig.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import tn.enig.model.UserEntity;

@Repository
public interface IUser extends JpaRepository<UserEntity, Long>{
	UserEntity findByUsername(String username);
}
