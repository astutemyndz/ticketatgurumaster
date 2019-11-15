
START TRANSACTION;

INSERT INTO `fields` VALUES (NULL, 'system_212', 'frontend', 'Label / Captcha is expired.', 'script', '2017-08-18 04:02:23');

SET @id := (SELECT LAST_INSERT_ID());

INSERT INTO `multi_lang` VALUES (NULL, @id, 'pjField', '::LOCALE::', 'title', 'The captcha is not correct. Please try again.', 'script');

COMMIT;