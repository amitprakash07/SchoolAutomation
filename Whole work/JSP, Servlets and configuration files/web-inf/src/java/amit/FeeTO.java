/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package amit;

/**
 *
 * @author Amit
 */
public class FeeTO {
    private String fee_id;
    private float tution_fee;

    /**
     * @return the fee_id
     */
    public String getFee_id() {
        return fee_id;
    }

    /**
     * @param fee_id the fee_id to set
     */
    public void setFee_id(String fee_id) {
        this.fee_id = fee_id;
    }

    /**
     * @return the tution_fee
     */
    public float getTution_fee() {
        return tution_fee;
    }

    /**
     * @param tution_fee the tution_fee to set
     */
    public void setTution_fee(float tution_fee) {
        this.tution_fee = tution_fee;
    }


    public String insertfee(){
        jdbcconnection j=new jdbcconnection();
        //String l=new String("','");
        //String i=new String("'");
        //String c=new String(",");
        String message=new String();
        check ch=new check();
        if(!ch.isfees(fee_id))
        {
            j.insertData("insert into fees values ('"+fee_id+"',"+tution_fee+")");
            message="New Fee Entry is successful";
        }
        else{
            if(ch.isfees(fee_id))message="Fee Id already exists";}
        return message;
    }
}
