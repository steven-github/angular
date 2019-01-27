import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import {
  MatSelectModule,
  MatProgressSpinnerModule,
  MatButtonModule,
  MatDatepickerModule,
  MatNativeDateModule,
  MatInputModule,
  MatIconModule,
  MatTooltipModule} from '@angular/material';

import { AppComponent } from './app.component';
import { HolidayApiService } from './holiday-api.service';
import { HttpClientModule } from '@angular/common/http';
import { CalendarComponent } from './calendar/calendar.component';

@NgModule({
  declarations: [
    AppComponent,
    CalendarComponent
  ],
  imports: [
    BrowserModule,
    FormsModule,
    ReactiveFormsModule,
    BrowserAnimationsModule,
    MatSelectModule,
    MatProgressSpinnerModule,
    MatButtonModule,
    MatDatepickerModule,
    MatNativeDateModule,
    MatInputModule,
    MatIconModule,
    MatTooltipModule,
    HttpClientModule
  ],
  providers: [
    HolidayApiService
  ],
  bootstrap: [AppComponent]
})
export class AppModule { }
