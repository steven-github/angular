import { Injectable } from "@angular/core";
import {
  HttpClient,
  HttpErrorResponse,
  HttpParams
} from "@angular/common/http";
import { Car } from "../car";
import { Observable, throwError } from "rxjs";
import { map, catchError, tap } from "rxjs/operators";

@Injectable({
  providedIn: "root"
})
export class CarsService {
  // baseUrl = "http://localhost/api";
  baseUrl = "http://iniapp.com/api";
  cars: Car[];

  constructor(private http: HttpClient) {}

  getAll(): Observable<Car[]> {
    return this.http.get(`${this.baseUrl}/getCars`).pipe(
      map(res => {
        this.cars = res["data"];
        return this.cars;
      }),
      catchError(this.handleError)
    );
  }

  getById(id: number): Observable<Car> {
    const url = `${this.baseUrl}/getCarsById?id=${id}`;
    return this.http.get<Car>(url).pipe(
      map(res => {
        // this.cars = res["data"];
        // return this.cars;
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
