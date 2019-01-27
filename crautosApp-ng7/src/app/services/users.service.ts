import { Injectable } from "@angular/core";
import {
  HttpClient,
  HttpErrorResponse,
  HttpParams
} from "@angular/common/http";
import { User } from "../user";
import { Observable, throwError } from "rxjs";
import { map, catchError, tap } from "rxjs/operators";

@Injectable({
  providedIn: "root"
})
export class UsersService {
  // baseUrl = "http://localhost/api";
  baseUrl = "http://iniapp.com/api";
  user: User[];

  constructor(private http: HttpClient) {}

  signUp(user: User): Observable<User[]> {
    return this.http.post(`${this.baseUrl}/signUp`, { data: user }).pipe(
      map(res => {
        // this.user = res["data"];
        // return this.user;
        return res["data"];
      }),
      catchError(this.handleError)
    );
  }

  signIn(user: User): Observable<User[]> {
    return this.http.post(`${this.baseUrl}/signIn`, { data: user }).pipe(
      map(res => {
        // this.user = res["data"];
        // return this.user;
        return res["data"];
      }),
      catchError(this.handleError)
    );
  }

  private handleError(error: HttpErrorResponse) {
    // return an observable with a user friendly message
    return throwError(error.error);
  }
}
