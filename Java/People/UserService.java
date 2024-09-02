package com.datorium.Datorium.API.Services;
import com.datorium.Datorium.API.DTOs.User;
import com.datorium.Datorium.API.Repo.UserRepo;

public class UserService {
    public UserRepo userRepo;

    public UserService() {
        userRepo = new UserRepo();
    }

    public int add(User user) {
        return userRepo.add(user);
    }
}
