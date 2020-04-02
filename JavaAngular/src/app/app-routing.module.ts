import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { ShowCustomerComponent } from './show-customer/show-customer.component';
import { AddCustomerComponent } from './add-customer/add-customer.component';

const routes: Routes = [
  {
    path : "",
    component : ShowCustomerComponent,
    pathMatch : "full"
  },
  {
    path: "show",
    component: ShowCustomerComponent
  },
  {
    path : "add",
    component : AddCustomerComponent
  },
  {
    path : "edit/:id",
    component : AddCustomerComponent
  }
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
