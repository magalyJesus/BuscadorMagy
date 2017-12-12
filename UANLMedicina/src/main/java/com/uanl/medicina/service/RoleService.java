
package com.uanl.medicina.service;

import com.uanl.medicina.dao.RoleDao;
import com.uanl.medicina.model.Role;
import java.util.List;
import org.springframework.stereotype.Service;

@Service
public class RoleService {
    public int addRole(Role role) {
        return new RoleDao().addRole(role);
    }
    public List<Role> getAllRole() {
        return new RoleDao().getAllRole();
    }
    public Role getRoleById(int IdRole) {
        return new RoleDao().getRoleById(IdRole);
    }
}
