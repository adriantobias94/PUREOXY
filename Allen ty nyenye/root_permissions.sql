INSERT INTO `user_role_links` (`role_id`, `link_id`) VALUES ('1', '37');
INSERT INTO `user_role_links` (`role_id`, `link_id`) VALUES ('1', '38');
INSERT INTO `user_role_links` (`role_id`, `link_id`) VALUES ('1', '39');
INSERT INTO `user_role_links` (`role_id`, `link_id`) VALUES ('1', '40');
INSERT `user_passport` SELECT 'root', `link_id` FROM user_role_links WHERE role_id='1'