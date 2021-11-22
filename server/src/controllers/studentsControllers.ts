import {Request, Response} from 'express';

import db from '../database'

class StudentsController{

    public index(req: Request,res: Response) {
        
        
        res.json(db.toString);

    }
  
}

const studentsController = new StudentsController();
export default studentsController;