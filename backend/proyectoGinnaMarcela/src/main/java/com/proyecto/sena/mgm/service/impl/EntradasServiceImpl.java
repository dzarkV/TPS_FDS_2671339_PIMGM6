package com.proyecto.sena.mgm.service.impl;

import com.proyecto.sena.mgm.entity.EntradasEntity;
import com.proyecto.sena.mgm.repository.EntradasRepository;
import com.proyecto.sena.mgm.service.EntradasService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class EntradasServiceImpl implements EntradasService {

    @Autowired
    private EntradasRepository entradasRepository;

    public List<EntradasEntity> getAll() {
        return entradasRepository.findAll();
    }

    public EntradasEntity save(EntradasEntity entrada) {
        return entradasRepository.save(entrada);
    }
}
