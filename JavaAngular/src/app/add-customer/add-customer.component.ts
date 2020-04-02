import { Component, OnInit } from '@angular/core';
import { FormBuilder } from '@angular/forms';
import { CustomerServiceService } from '../customer-service.service';
import { Router,ActivatedRoute } from '@angular/router';

@Component({
  selector: 'app-add-customer',
  templateUrl: './add-customer.component.html',
  styleUrls: ['./add-customer.component.css']
})
export class AddCustomerComponent implements OnInit {

  constructor(
    private addFB : FormBuilder,
    private custService : CustomerServiceService,
    private router : Router,
    private Aroute : ActivatedRoute
  ) { }

  id = this.Aroute.snapshot.params.id;

  ngOnInit(){
    var obj;
    if(this.id!=null)
    {
      this.custService.getCustomer(this.id).subscribe(data => {obj=data,console.log(data),
        this.addForm.patchValue({
          cid : obj.cid,
          fname : obj.fname,
          lname : obj.lname
        });
      });
    }
  }

    addForm = this.addFB.group({
      cid : [''],
      fname : [''],
      lname : ['']
    });

    addUpd(){
      var obj = {
        cid : this.addForm.value.cid,
        fname : this.addForm.value.fname,
        lname : this.addForm.value.lname
      }
      console.log(obj);
      if(this.id!=null)
      {
        this.custService.updateCustomer(obj).subscribe(res => {
          console.log("Yeah"),
          setTimeout(() => {
            this.router.navigate(['/show']);
          }, 1000);
        });
      }
      else
      {
        this.custService.addCustomer(obj).subscribe(res => {
          console.log("Yeah"),
          setTimeout(() => {
            this.router.navigate(['/show']);
          }, 1000);
        });
      }
    }

}
