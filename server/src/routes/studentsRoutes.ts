import { Router } from 'express';

import studentsController from '../controllers/studentsControllers'

class StudentsRoutes{

    public router: Router = Router();

    constructor() {
        this.config();
    }

    config(): void {
        this.router.get('/', studentsController.index);
    }

}

const studentsRoutes = new StudentsRoutes();
export default studentsRoutes.router;