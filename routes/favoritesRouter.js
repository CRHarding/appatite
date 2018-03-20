const express = require('express');
const favoritesRouter = express.Router();
const favoritesController = require('../controllers/favoriteController');

favoritesRouter
  .route(`/:id`)
  .get(favoritesController.getFavorites)
  .post(favoritesController.updateFavorite);

module.exports = favoritesRouter;
