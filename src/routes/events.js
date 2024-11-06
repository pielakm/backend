// routes/events.js
import { Router } from "express";
import { PrismaClient } from "@prisma/client";

const router = Router();
const prisma = new PrismaClient();

// Get all events with related locations and categories
router.get("/", async (req, res) => {
    try {
        const events = await prisma.events.findMany({
            include: {
                event_location: {
                    include: {
                        city: true
                    }
                },
                event_category: true,
            }
        });
        res.status(200).json(events);
    } catch (error) {
        res.status(500).json({ success: false, error: error.message });
    }
});

router.get('/:id', async (req, res) => {
    const { id } = req.params;
    try {
        const event = await prisma.events.findUnique({
            where: { idevent: parseInt(id) }, // Ensure this matches your database field
        });
        if (event) {
            res.status(200).json({ event });
        } else {
            res.status(404).json({ message: 'Event not found' });
        }
    } catch (error) {
        res.status(500).json({ success: false, error: error.message });
    }
});

export default router;
