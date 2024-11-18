-- MySQL Workbench Synchronization
-- Generated: 2024-11-18 12:37
-- Model: New Model
-- Version: 1.0
-- Project: Name of the project
-- Author: formacio

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

CREATE SCHEMA IF NOT EXISTS `youtube` DEFAULT CHARACTER SET utf8mb3 ;

CREATE TABLE IF NOT EXISTS `youtube`.`channel` (
  `channel_id` INT(11) NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `description` VARCHAR(45) NULL DEFAULT NULL,
  `creation_date` DATETIME NOT NULL,
  `user_user_id` INT(11) NOT NULL,
  PRIMARY KEY (`channel_id`),
  INDEX `fk_channel_user1_idx` (`user_user_id` ASC) VISIBLE,
  CONSTRAINT `fk_channel_user1`
    FOREIGN KEY (`user_user_id`)
    REFERENCES `youtube`.`user` (`user_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;

CREATE TABLE IF NOT EXISTS `youtube`.`channel_subscription` (
  `channel_channel_id` INT(11) NOT NULL,
  `user_user_id` INT(11) NOT NULL,
  PRIMARY KEY (`channel_channel_id`, `user_user_id`),
  INDEX `fk_channel_subscription_user1_idx` (`user_user_id` ASC) VISIBLE,
  CONSTRAINT `fk_channel_subscription_channel1`
    FOREIGN KEY (`channel_channel_id`)
    REFERENCES `youtube`.`channel` (`channel_id`),
  CONSTRAINT `fk_channel_subscription_user1`
    FOREIGN KEY (`user_user_id`)
    REFERENCES `youtube`.`user` (`user_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;

CREATE TABLE IF NOT EXISTS `youtube`.`comment` (
  `comment_id` INT(11) NOT NULL,
  `text` VARCHAR(45) NULL DEFAULT NULL,
  `datetime_comment` DATETIME NOT NULL,
  `user_user_id` INT(11) NOT NULL,
  `video_video_id` INT(11) NOT NULL,
  PRIMARY KEY (`comment_id`),
  INDEX `fk_comment_user1_idx` (`user_user_id` ASC) VISIBLE,
  INDEX `fk_comment_video1_idx` (`video_video_id` ASC) VISIBLE,
  CONSTRAINT `fk_comment_user1`
    FOREIGN KEY (`user_user_id`)
    REFERENCES `youtube`.`user` (`user_id`),
  CONSTRAINT `fk_comment_video1`
    FOREIGN KEY (`video_video_id`)
    REFERENCES `youtube`.`video` (`video_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;

CREATE TABLE IF NOT EXISTS `youtube`.`playlist` (
  `playlist_id` INT(11) NOT NULL,
  `name` VARCHAR(45) NULL DEFAULT NULL,
  `creation_date` VARCHAR(45) NULL DEFAULT NULL,
  `status` VARCHAR(45) NULL DEFAULT NULL,
  `user_user_id` INT(11) NOT NULL,
  PRIMARY KEY (`playlist_id`),
  INDEX `fk_playlist_user1_idx` (`user_user_id` ASC) VISIBLE,
  CONSTRAINT `fk_playlist_user1`
    FOREIGN KEY (`user_user_id`)
    REFERENCES `youtube`.`user` (`user_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;

CREATE TABLE IF NOT EXISTS `youtube`.`rating_comment` (
  `datetime_rating` INT(11) NOT NULL,
  `like` VARCHAR(45) NULL DEFAULT NULL,
  `dislike` VARCHAR(45) NULL DEFAULT NULL,
  `user_user_id` INT(11) NOT NULL,
  `comment_comment_id` INT(11) NOT NULL,
  PRIMARY KEY (`user_user_id`, `comment_comment_id`),
  INDEX `fk_rating_comment_comment1_idx` (`comment_comment_id` ASC) VISIBLE,
  CONSTRAINT `fk_rating_comment_comment1`
    FOREIGN KEY (`comment_comment_id`)
    REFERENCES `youtube`.`comment` (`comment_id`),
  CONSTRAINT `fk_rating_comment_user1`
    FOREIGN KEY (`user_user_id`)
    REFERENCES `youtube`.`user` (`user_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;

CREATE TABLE IF NOT EXISTS `youtube`.`rating_video` (
  `date_time` DATETIME NOT NULL,
  `like` INT(11) NULL DEFAULT NULL,
  `dislike` INT(11) NULL DEFAULT NULL,
  `video_video_id` INT(11) NOT NULL,
  `user_user_id` INT(11) NOT NULL,
  PRIMARY KEY (`video_video_id`, `user_user_id`),
  INDEX `fk_rating_video_user1_idx` (`user_user_id` ASC) VISIBLE,
  CONSTRAINT `fk_rating_video_user1`
    FOREIGN KEY (`user_user_id`)
    REFERENCES `youtube`.`user` (`user_id`),
  CONSTRAINT `fk_rating_video_video1`
    FOREIGN KEY (`video_video_id`)
    REFERENCES `youtube`.`video` (`video_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;

CREATE TABLE IF NOT EXISTS `youtube`.`tag` (
  `tag_id` INT(11) NOT NULL,
  `name` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`tag_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;

CREATE TABLE IF NOT EXISTS `youtube`.`user` (
  `user_id` INT(11) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `username` VARCHAR(45) NULL DEFAULT NULL,
  `date_birth` VARCHAR(45) NULL DEFAULT NULL,
  `gender` VARCHAR(45) NULL DEFAULT NULL,
  `country` VARCHAR(45) NULL DEFAULT NULL,
  `postal_code` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;

CREATE TABLE IF NOT EXISTS `youtube`.`video` (
  `video_id` INT(11) NOT NULL,
  `title` VARCHAR(45) NULL DEFAULT NULL,
  `description` VARCHAR(45) NULL DEFAULT NULL,
  `size` VARCHAR(45) NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `length` VARCHAR(45) NOT NULL,
  `thumbnail` VARCHAR(45) NULL DEFAULT NULL,
  `num_views` VARCHAR(45) NULL DEFAULT NULL,
  `num_dislikes` VARCHAR(45) NULL DEFAULT NULL,
  `num_likes` VARCHAR(45) NULL DEFAULT NULL,
  `status` VARCHAR(45) NOT NULL,
  `datetime_publication` VARCHAR(45) NOT NULL,
  `user_user_id` INT(11) NOT NULL,
  PRIMARY KEY (`video_id`),
  INDEX `fk_video_user1_idx` (`user_user_id` ASC) VISIBLE,
  CONSTRAINT `fk_video_user1`
    FOREIGN KEY (`user_user_id`)
    REFERENCES `youtube`.`user` (`user_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;

CREATE TABLE IF NOT EXISTS `youtube`.`video_added` (
  `video_added_id` INT(11) NOT NULL,
  `video_video_id` INT(11) NOT NULL,
  `playlist_playlist_id` INT(11) NOT NULL,
  PRIMARY KEY (`video_added_id`),
  INDEX `fk_video_added_video1_idx` (`video_video_id` ASC) VISIBLE,
  INDEX `fk_video_added_playlist1_idx` (`playlist_playlist_id` ASC) VISIBLE,
  CONSTRAINT `fk_video_added_playlist1`
    FOREIGN KEY (`playlist_playlist_id`)
    REFERENCES `youtube`.`playlist` (`playlist_id`),
  CONSTRAINT `fk_video_added_video1`
    FOREIGN KEY (`video_video_id`)
    REFERENCES `youtube`.`video` (`video_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
