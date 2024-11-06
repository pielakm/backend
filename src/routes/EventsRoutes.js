import express from "express"
import { EventCreate, EventRead, EventUpdate, EventReadById ,EventDelete} from "../controllers/EventsControllers"
const event_controllers = express.Router()
import { authCheck } from "../middlewares/AuthCheck"
import { checkPermission } from "../middlewares/rbacMiddleware"; 

//      CREATE EVENT ROUTES
event_controllers.post("/create",authCheck, checkPermission('events', 'create'), EventCreate)
event_controllers.get("/read", EventRead)
event_controllers.get("/read/:id", EventReadById)
event_controllers.put("/update/:id",authCheck, checkPermission('events', 'update'), EventUpdate)
event_controllers.delete("/delete/:id",authCheck, checkPermission('events', 'delete'), EventDelete)


export default event_controllers 