import { Component } from '@angular/core';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.less']
})
export class AppComponent {
  title = 'sidebarApp-ng7';
  navCollapsed = true;
  toggleMenu(event: Event) {
    console.log('Click!', event);
    this.navCollapsed = !this.navCollapsed;
  }
}
