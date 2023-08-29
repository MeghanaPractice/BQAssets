package com.example.Assets.Service;
import com.example.Assets.Model.Software;
import com.example.Assets.Model.SoftwareDTO;
import com.fasterxml.jackson.core.JsonGenerator;
import com.fasterxml.jackson.databind.JsonSerializer;
import com.fasterxml.jackson.databind.SerializerProvider;
import java.io.IOException;

public class SoftwareSerializer extends JsonSerializer<Software> {
    @Override
    public void serialize(Software software, JsonGenerator jsonGenerator, SerializerProvider serializerProvider)
            throws IOException {
        SoftwareDTO softwareDTO = new SoftwareDTO();
        softwareDTO.setSoftwareNo(software.getSoftwareNo());
        softwareDTO.setSoftwareName(software.getSoftwareName());
        softwareDTO.setType(software.getType());
        softwareDTO.setMaxUsers(software.getMaxUsers());
        softwareDTO.setAssignedTo(software.getAssignedTo());
        softwareDTO.setInTeam(software.getInTeam());
        softwareDTO.setSoftwareID(software.getSoftwareID());
        softwareDTO.setSoftwareKey(software.getSoftwareKey());
        softwareDTO.setPurchaseDate(software.getPurchaseDate());
        softwareDTO.setExpirationDate(software.getExpirationDate());
        softwareDTO.setUsername(software.getUsername());
        softwareDTO.setPassword(software.getPassword());
        softwareDTO.setAdditionalInformation(software.getAdditionalInformation());
        softwareDTO.setAssignedLaptops(software.getAssignedLaptops());
        jsonGenerator.writeObject(softwareDTO);
    }
}