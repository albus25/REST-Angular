import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';

@Injectable({
  providedIn: 'root'
})
export class CustomerServiceService {

  constructor(
    private http:HttpClient
  ) { }
  uri = "http://localhost:8080/Rest_App1-war/webresources/generic";

  allCustomer()
  {
    return this.http.get(this.uri+"/");
  }

  addCustomer(obj)
  {
    return this.http.post(this.uri+"/addCustomer",obj);
  }

  getCustomer(key)
  {
    return this.http.get(this.uri+"/getCustomer/"+key);
  }

  updateCustomer(obj)
  {
    return this.http.post(this.uri+"/updateCustomer",obj);
  }

  deleteCustomer(key)
  {
    alert(this.uri + "/deleteCustomer/" + key);
    return this.http.delete(this.uri +"/deleteCustomer/19");
  }
}
