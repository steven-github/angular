import { Component, OnInit } from "@angular/core";
import { FormBuilder, FormGroup, Validators } from "@angular/forms";
import { UsersService } from "../services/users.service";
import { User } from "../user";

@Component({
  selector: "app-signup",
  templateUrl: "./signup.component.html",
  styleUrls: ["./signup.component.scss"]
})
export class SignupComponent implements OnInit {
  signupForm: FormGroup;
  submitted = false;
  success = false;
  user: User[];
  error: string;
  // user = new User(1, "Steven", "Sanchez", "stvn20@gmail.com", "12345");

  constructor(
    private _formBuilder: FormBuilder,
    private _usersService: UsersService
  ) {}

  ngOnInit() {
    this.signupForm = this._formBuilder.group({
      first_name: ["", Validators.required],
      last_name: ["", Validators.required],
      email: ["", Validators.required],
      password: ["", Validators.required],
      confirmpassword: ["", Validators.required]
    });
  }

  onSubmit() {
    this.submitted = true;
    if (this.signupForm.invalid) {
      return;
    }

    this.signUp(this.signupForm);
  }

  signUp(form: object): void {
    this._usersService.signUp(form["value"]).subscribe(
      (res: User[]) => {
        this.user = res;
        console.log("this.user", this.user);
        this.signupForm.reset();
        this.signupForm.clearValidators();
        this.error = "";
        this.success = true;
        this.submitted = false;
        setTimeout(() => {
          this.success = false;
        }, 2500);
      },
      err => {
        this.error = err;
      }
    );
  }
}
