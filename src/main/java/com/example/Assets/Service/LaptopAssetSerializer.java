package com.example.Assets.Service;

import com.example.Assets.Model.LaptopAsset;
import com.example.Assets.Model.LaptopAssetDTO;
import com.example.Assets.Model.Software;
import com.fasterxml.jackson.core.JsonGenerator;
import com.fasterxml.jackson.databind.JsonSerializer;
import com.fasterxml.jackson.databind.SerializerProvider;

import java.io.IOException;
import java.util.stream.Collectors;

public class LaptopAssetSerializer extends JsonSerializer<LaptopAsset> {

    @Override
    public void serialize(LaptopAsset laptopAsset, JsonGenerator jsonGenerator, SerializerProvider serializerProvider) throws IOException {
        LaptopAssetDTO laptopAssetDTO = new LaptopAssetDTO();
        laptopAssetDTO.setLaptopNo(laptopAsset.getLaptopNo());
        laptopAssetDTO.setInUse(laptopAsset.isInUse());
        laptopAssetDTO.setLaptopAssetID(laptopAsset.getLaptopAssetID());
        laptopAssetDTO.setBrand(laptopAsset.getBrand());
        laptopAssetDTO.setModelName(laptopAsset.getModelName());
        laptopAssetDTO.setModelNo(laptopAsset.getModelNo());
        laptopAssetDTO.setSerialNo(laptopAsset.getSerialNo());
        laptopAssetDTO.setTeam_ID(laptopAsset.getTeam_ID());
        laptopAssetDTO.setEmpID(laptopAsset.getEmpID());
        laptopAssetDTO.setPurchaseDate(laptopAsset.getPurchaseDate());
        laptopAssetDTO.setScreenSize(laptopAsset.getScreenSize());
        laptopAssetDTO.setCharlesID(laptopAsset.getCharlesID());
        laptopAssetDTO.setCharlesKey(laptopAsset.getCharlesKey());
        laptopAssetDTO.setMSOfficeKey(laptopAsset.getMSOfficeKey());
        laptopAssetDTO.setMSOfficeUsername(laptopAsset.getMSOfficeUsername());
        laptopAssetDTO.setMSOfficePassword(laptopAsset.getMSOfficePassword());
        laptopAssetDTO.setAccessories(laptopAsset.getAccessories());
        laptopAssetDTO.setWarranty(laptopAsset.getWarranty());
        laptopAssetDTO.setAdditionalItems(laptopAsset.getAdditionalItems());
        laptopAssetDTO.setAssignedSoftwareNames(
                laptopAsset.getAssignedSoftwares()
                        .stream()
                        .map(Software::getSoftwareName) // Assuming you have a getter for software name
                        .collect(Collectors.toList())
        );        laptopAssetDTO.setOtherDetails(laptopAsset.getOtherDetails());
        jsonGenerator.writeObject(laptopAssetDTO);

    }
}
