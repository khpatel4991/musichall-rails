import { Component, OnInit } from '@angular/core';
import { Song } from './song.model'


@Component({
    //module: moduleId,
    selector: 'song',
    templateUrl: 'assets/songs/song.component.html'
})
export class SongComponent implements OnInit {
    constructor() { }

    ngOnInit() { }

}