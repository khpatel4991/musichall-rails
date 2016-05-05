import { Component, OnInit} from '@angular/core';
import {Inject} from '@angular/core';
import { Song } from './song.model'
import { SongService } from './song.service'
import {SongComponent} from "./song.component";

@Component({
    selector: 'songs',
    templateUrl: 'songs.component.html',
    directives: [SongComponent],
    providers: [SongService]
})
export class SongsComponent implements OnInit {
    songs: Song[];
    constructor(private songService: SongService) { }

    ngOnInit() {
        this.songService.getSongs()
            .subscribe(songs => this.songs = songs);
         
       
     }
}