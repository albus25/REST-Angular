package EntityPack;

import EntityPack.Tblcustomer;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2020-04-01T20:23:59")
@StaticMetamodel(Tbladdress.class)
public class Tbladdress_ { 

    public static volatile SingularAttribute<Tbladdress, String> zip;
    public static volatile SingularAttribute<Tbladdress, String> city;
    public static volatile SingularAttribute<Tbladdress, String> street;
    public static volatile SingularAttribute<Tbladdress, String> state;
    public static volatile SingularAttribute<Tbladdress, Integer> aid;
    public static volatile SingularAttribute<Tbladdress, Tblcustomer> cid;

}