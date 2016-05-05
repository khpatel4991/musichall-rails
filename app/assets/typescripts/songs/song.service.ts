import { Injectable } from '@angular/core';
import {Http, Response} from '@angular/http';
import 'rxjs/add/operator/map';


@Injectable()
export class SongService {

    constructor(private http: Http) { }
    getSongs() {
        return this.http.get('/songs')
        .map((res: Response) => res.json());
    }

}