import {Component} from '@angular/core'

import {SongsComponent} from './songs/songs.component'

@Component({
    selector: 'my-app',
    directives: [SongsComponent], 
    template: `
    <h1>Angular Hello</h1>

    <div>
        <songs></songs>
    </div>
    `
})

export class AppComponent {}