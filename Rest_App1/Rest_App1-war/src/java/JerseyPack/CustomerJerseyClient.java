/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package JerseyPack;

import javax.ws.rs.ClientErrorException;
import javax.ws.rs.client.Client;
import javax.ws.rs.client.WebTarget;

/**
 * Jersey REST client generated for REST resource:GenericResource [generic]<br>
 * USAGE:
 * <pre>
 *        CustomerJerseyClient client = new CustomerJerseyClient();
 *        Object response = client.XXX(...);
 *        // do whatever with response
 *        client.close();
 * </pre>
 *
 * @author Albus
 */
public class CustomerJerseyClient {

    private WebTarget webTarget;
    private Client client;
    private static final String BASE_URI = "http://localhost:8080/Rest_App1-war/webresources";

    public CustomerJerseyClient() {
        client = javax.ws.rs.client.ClientBuilder.newClient();
        webTarget = client.target(BASE_URI).path("generic");
    }

    public void addCustomer(Object requestEntity) throws ClientErrorException {
        webTarget.path("addCustomer").request(javax.ws.rs.core.MediaType.APPLICATION_JSON).post(javax.ws.rs.client.Entity.entity(requestEntity, javax.ws.rs.core.MediaType.APPLICATION_JSON));
    }

    public <T> T allCustomer(Class<T> responseType) throws ClientErrorException {
        WebTarget resource = webTarget;
        return resource.request().get(responseType);
    }

    public void updateCustomer(Object requestEntity) throws ClientErrorException {
        webTarget.path("updateCustomer").request(javax.ws.rs.core.MediaType.APPLICATION_JSON).post(javax.ws.rs.client.Entity.entity(requestEntity, javax.ws.rs.core.MediaType.APPLICATION_JSON));
    }

    public void deleteCustomer(String cid) throws ClientErrorException {
        webTarget.path(java.text.MessageFormat.format("deleteCustomer/{0}", new Object[]{cid})).request().delete();
    }

    public <T> T getCustomer(Class<T> responseType, String cid) throws ClientErrorException {
        WebTarget resource = webTarget;
        resource = resource.path(java.text.MessageFormat.format("getCustomer/{0}", new Object[]{cid}));
        return resource.request().get(responseType);
    }

    public void close() {
        client.close();
    }
    
}
