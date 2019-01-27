import { Component, OnInit } from "@angular/core";
import { FormBuilder, FormGroup, Validators } from "@angular/forms";
import { UsersService } from "../services/users.service";
import { User } from "../user";
import { Router } from "@angular/router";
import { ToasterService } from "angular2-toaster";

@Component({
  selector: "app-signin",
  templateUrl: "./signin.component.html",
  styleUrls: ["./signin.component.scss"]
})
export class SigninComponent implements OnInit {
  signinForm: FormGroup;
  submitted = false;
  success = false;
  user: User[];
  error: string;

  constructor(
    private _formBuilder: FormBuilder,
    private _usersService: UsersService,
    private _router: Router,
    private _toastr: ToasterService
  ) {}

  ngOnInit() {
    this.signinForm = this._formBuilder.group({
      email: ["", Validators.required],
      password: ["", Validators.required]
    });
  }

  onSubmit() {
    this.submitted = true;
    if (this.signinForm.invalid) {
      return;
    }

    this.signIn(this.signinForm);
  }

  signIn(form: object): void {
    this._usersService.signIn(form["value"]).subscribe(
      (res: User[]) => {
        this.user = res;
        this.signinForm.reset();
        this.signinForm.clearValidators();
        this.error = "";
        this.success = true;
        this.submitted = false;
        sessionStorage.setItem("name", this.user["first_name"]);
        sessionStorage.setItem("username", this.user["email"]);
        sessionStorage.setItem("token", this.user["password"]);
        // this._router.navigateByUrl("/dashboard");
        this._router.navigate(["/dashboard"]);
        // setTimeout(() => {
        //   this.success = false;
        // }, 1500);
        // this._toastr.pop(
        //   "success",
        //   "SUCCESS",
        //   "Welcome back " + this.user["first_name"]
        // );
      },
      err => {
        this.error = err;
        // this._toastr.pop("error", "ERROR", err);
      }
    );
  }
}
