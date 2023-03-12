package com.springbootmysqldocker.repository;

import com.springbootmysqldocker.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserRepository extends JpaRepository<User, Long> {
}
