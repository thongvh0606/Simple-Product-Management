/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.product;

import java.io.Serializable;

/**
 *
 * @author user
 */
public class ProductInsertError implements Serializable{
    private String idLengthErr;
    private String nameLengthErr;
    private String unitLengthErr;
    private String idExisted;

    public ProductInsertError() {
    }

    public ProductInsertError(String idLengthErr, String nameLengthErr, String unitLengthErr) {
        this.idLengthErr = idLengthErr;
        this.nameLengthErr = nameLengthErr;
        this.unitLengthErr = unitLengthErr;
    }

    public ProductInsertError(String idLengthErr, String nameLengthErr, String unitLengthErr, String idExisted) {
        this.idLengthErr = idLengthErr;
        this.nameLengthErr = nameLengthErr;
        this.unitLengthErr = unitLengthErr;
        this.idExisted = idExisted;
    }

    
    /**
     * @return the idLengthErr
     */
    public String getIdLengthErr() {
        return idLengthErr;
    }

    /**
     * @param idLengthErr the idLengthErr to set
     */
    public void setIdLengthErr(String idLengthErr) {
        this.idLengthErr = idLengthErr;
    }

    /**
     * @return the nameLengthErr
     */
    public String getNameLengthErr() {
        return nameLengthErr;
    }

    /**
     * @param nameLengthErr the nameLengthErr to set
     */
    public void setNameLengthErr(String nameLengthErr) {
        this.nameLengthErr = nameLengthErr;
    }

    /**
     * @return the unitLengthErr
     */
    public String getUnitLengthErr() {
        return unitLengthErr;
    }

    /**
     * @param unitLengthErr the unitLengthErr to set
     */
    public void setUnitLengthErr(String unitLengthErr) {
        this.unitLengthErr = unitLengthErr;
    }

    /**
     * @return the idExisted
     */
    public String getIdExisted() {
        return idExisted;
    }

    /**
     * @param idExisted the idExisted to set
     */
    public void setIdExisted(String idExisted) {
        this.idExisted = idExisted;
    }
    
}
