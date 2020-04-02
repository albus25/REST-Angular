import { Component, OnInit } from '@angular/core';
import { CustomerServiceService } from '../customer-service.service';
import { Router } from '@angular/router';

@Component({
  selector: 'app-show-customer',
  templateUrl: './show-customer.component.html',
  styleUrls: ['./show-customer.component.css']
})
export class ShowCustomerComponent implements OnInit {
  
  constructor(
    private custService : CustomerServiceService,
    private router : Router
    ) { }
    
  custList : any
  
  ngOnInit(): void {
    this.custService.allCustomer().subscribe(data => {this.custList = data,console.log(this.custList)})
  }

  deleteCustomer(key)
  {
    alert(key.cid)
    this.custService.deleteCustomer(key.cid).subscribe(res => {
      setTimeout(() => {
        this.router.navigate(['/show']);
      }, 1000);
    });
  }
}
