package com.proyecto.sena.mgm.service;

import com.proyecto.sena.mgm.entity.EntradasEntity;

import java.util.List;

public interface EntradasService {

    List<EntradasEntity> getAll();

    public EntradasEntity save(EntradasEntity entrada);
}
