import { Component, OnInit, Input } from "@angular/core";
import { Router } from "@angular/router";

@Component({
  selector: "app-navbar",
  templateUrl: "./navbar.component.html",
  styleUrls: ["./navbar.component.scss"]
})
export class NavbarComponent implements OnInit {
  // @Input() username: string;
  name: string;

  constructor(private _router: Router) {}

  ngOnInit() {}

  ngAfterContentChecked() {
    if (sessionStorage.getItem("name")) {
      // this.username = sessionStorage.getItem("username");
      this.name = sessionStorage.getItem("name");
    }
    if (!sessionStorage.getItem("name") && this._router.url == "/dashboard") {
      this._router.navigate(["/"]);
    }
  }

  logout() {
    // this.username = "";
    this.name = "";
    sessionStorage.clear();
  }
}
