// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Home`
  String get home {
    return Intl.message(
      'Home',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `Weight`
  String get weight {
    return Intl.message(
      'Weight',
      name: 'weight',
      desc: '',
      args: [],
    );
  }

  /// `Heart Rate`
  String get heartrate {
    return Intl.message(
      'Heart Rate',
      name: 'heartrate',
      desc: '',
      args: [],
    );
  }

  /// `Meal Plan`
  String get mealplan {
    return Intl.message(
      'Meal Plan',
      name: 'mealplan',
      desc: '',
      args: [],
    );
  }

  /// `Schedule`
  String get schedule {
    return Intl.message(
      'Schedule',
      name: 'schedule',
      desc: '',
      args: [],
    );
  }

  /// `Running`
  String get running {
    return Intl.message(
      'Running',
      name: 'running',
      desc: '',
      args: [],
    );
  }

  /// `Excercises`
  String get excercises {
    return Intl.message(
      'Excercises',
      name: 'excercises',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message(
      'Settings',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `Support`
  String get support {
    return Intl.message(
      'Support',
      name: 'support',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get bhome {
    return Intl.message(
      'Home',
      name: 'bhome',
      desc: '',
      args: [],
    );
  }

  /// `chat`
  String get bchat {
    return Intl.message(
      'chat',
      name: 'bchat',
      desc: '',
      args: [],
    );
  }

  /// `Weight`
  String get bweight {
    return Intl.message(
      'Weight',
      name: 'bweight',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get bsetting {
    return Intl.message(
      'Settings',
      name: 'bsetting',
      desc: '',
      args: [],
    );
  }

  /// `Fitness Application`
  String get fitness {
    return Intl.message(
      'Fitness Application',
      name: 'fitness',
      desc: '',
      args: [],
    );
  }

  /// `Push-Up`
  String get push {
    return Intl.message(
      'Push-Up',
      name: 'push',
      desc: '',
      args: [],
    );
  }

  /// `Leg Extention`
  String get leg {
    return Intl.message(
      'Leg Extention',
      name: 'leg',
      desc: '',
      args: [],
    );
  }

  /// `Training Day1`
  String get day1 {
    return Intl.message(
      'Training Day1',
      name: 'day1',
      desc: '',
      args: [],
    );
  }

  /// `Training Day2`
  String get day2 {
    return Intl.message(
      'Training Day2',
      name: 'day2',
      desc: '',
      args: [],
    );
  }

  /// `Training Day3`
  String get day3 {
    return Intl.message(
      'Training Day3',
      name: 'day3',
      desc: '',
      args: [],
    );
  }

  /// `week`
  String get week {
    return Intl.message(
      'week',
      name: 'week',
      desc: '',
      args: [],
    );
  }

  /// `Excercises1`
  String get ex1 {
    return Intl.message(
      'Excercises1',
      name: 'ex1',
      desc: '',
      args: [],
    );
  }

  /// `Excercises2`
  String get ex2 {
    return Intl.message(
      'Excercises2',
      name: 'ex2',
      desc: '',
      args: [],
    );
  }

  /// `Finished`
  String get ex3 {
    return Intl.message(
      'Finished',
      name: 'ex3',
      desc: '',
      args: [],
    );
  }

  /// `7 minutes`
  String get m7 {
    return Intl.message(
      '7 minutes',
      name: 'm7',
      desc: '',
      args: [],
    );
  }

  /// `15 minutes`
  String get m15 {
    return Intl.message(
      '15 minutes',
      name: 'm15',
      desc: '',
      args: [],
    );
  }

  /// `5 minutes`
  String get m5 {
    return Intl.message(
      '5 minutes',
      name: 'm5',
      desc: '',
      args: [],
    );
  }

  /// `workouts`
  String get workout {
    return Intl.message(
      'workouts',
      name: 'workout',
      desc: '',
      args: [],
    );
  }

  /// `Play Video & Timer`
  String get play {
    return Intl.message(
      'Play Video & Timer',
      name: 'play',
      desc: '',
      args: [],
    );
  }

  /// `Pause Video & Timer`
  String get pause {
    return Intl.message(
      'Pause Video & Timer',
      name: 'pause',
      desc: '',
      args: [],
    );
  }

  /// `Your Weight Progress`
  String get weightprogress {
    return Intl.message(
      'Your Weight Progress',
      name: 'weightprogress',
      desc: '',
      args: [],
    );
  }

  /// `Add more photos to track your progress`
  String get addm {
    return Intl.message(
      'Add more photos to track your progress',
      name: 'addm',
      desc: '',
      args: [],
    );
  }

  /// `Select Date`
  String get selectdata {
    return Intl.message(
      'Select Date',
      name: 'selectdata',
      desc: '',
      args: [],
    );
  }

  /// `Enter your weight`
  String get enterwight {
    return Intl.message(
      'Enter your weight',
      name: 'enterwight',
      desc: '',
      args: [],
    );
  }

  /// `Add`
  String get add {
    return Intl.message(
      'Add',
      name: 'add',
      desc: '',
      args: [],
    );
  }

  /// `meters`
  String get meters {
    return Intl.message(
      'meters',
      name: 'meters',
      desc: '',
      args: [],
    );
  }

  /// `Rate your Heart Measure`
  String get rate {
    return Intl.message(
      'Rate your Heart Measure',
      name: 'rate',
      desc: '',
      args: [],
    );
  }

  /// `cover both the camera and the flah with your finger`
  String get cover {
    return Intl.message(
      'cover both the camera and the flah with your finger',
      name: 'cover',
      desc: '',
      args: [],
    );
  }

  /// `Bulking`
  String get bulking {
    return Intl.message(
      'Bulking',
      name: 'bulking',
      desc: '',
      args: [],
    );
  }

  /// `Cutting`
  String get cutting {
    return Intl.message(
      'Cutting',
      name: 'cutting',
      desc: '',
      args: [],
    );
  }

  /// `monday`
  String get monday {
    return Intl.message(
      'monday',
      name: 'monday',
      desc: '',
      args: [],
    );
  }

  /// `tuesday`
  String get tuesday {
    return Intl.message(
      'tuesday',
      name: 'tuesday',
      desc: '',
      args: [],
    );
  }

  /// `wednesday`
  String get wednesday {
    return Intl.message(
      'wednesday',
      name: 'wednesday',
      desc: '',
      args: [],
    );
  }

  /// `thursday`
  String get thursday {
    return Intl.message(
      'thursday',
      name: 'thursday',
      desc: '',
      args: [],
    );
  }

  /// `friday`
  String get friday {
    return Intl.message(
      'friday',
      name: 'friday',
      desc: '',
      args: [],
    );
  }

  /// `saturday`
  String get saturday {
    return Intl.message(
      'saturday',
      name: 'saturday',
      desc: '',
      args: [],
    );
  }

  /// `sunday`
  String get sunday {
    return Intl.message(
      'sunday',
      name: 'sunday',
      desc: '',
      args: [],
    );
  }

  /// `Image deleted`
  String get Imagedeleted {
    return Intl.message(
      'Image deleted',
      name: 'Imagedeleted',
      desc: '',
      args: [],
    );
  }

  /// `Weight entry deleted`
  String get Weightentrydeleted {
    return Intl.message(
      'Weight entry deleted',
      name: 'Weightentrydeleted',
      desc: '',
      args: [],
    );
  }

  /// `Select Diet Type`
  String get Select_Diet_Type {
    return Intl.message(
      'Select Diet Type',
      name: 'Select_Diet_Type',
      desc: '',
      args: [],
    );
  }

  /// `Select Day`
  String get Select_Day {
    return Intl.message(
      'Select Day',
      name: 'Select_Day',
      desc: '',
      args: [],
    );
  }

  /// `Max daily is {meters} meters`
  String max_daily_meters(Object meters) {
    return Intl.message(
      'Max daily is $meters meters',
      name: 'max_daily_meters',
      desc: '',
      args: [meters],
    );
  }

  /// `Steps: {steps}`
  String steps_walked(Object steps) {
    return Intl.message(
      'Steps: $steps',
      name: 'steps_walked',
      desc: '',
      args: [steps],
    );
  }

  /// `lenght`
  String get lenght {
    return Intl.message(
      'lenght',
      name: 'lenght',
      desc: '',
      args: [],
    );
  }

  /// `km`
  String get km {
    return Intl.message(
      'km',
      name: 'km',
      desc: '',
      args: [],
    );
  }

  /// `min 50`
  String get min {
    return Intl.message(
      'min 50',
      name: 'min',
      desc: '',
      args: [],
    );
  }

  /// `max 150`
  String get max {
    return Intl.message(
      'max 150',
      name: 'max',
      desc: '',
      args: [],
    );
  }

  /// `unlock`
  String get unlock {
    return Intl.message(
      'unlock',
      name: 'unlock',
      desc: '',
      args: [],
    );
  }

  /// `Excercise Categories`
  String get exercisecat {
    return Intl.message(
      'Excercise Categories',
      name: 'exercisecat',
      desc: '',
      args: [],
    );
  }

  /// `Push`
  String get pushh {
    return Intl.message(
      'Push',
      name: 'pushh',
      desc: '',
      args: [],
    );
  }

  /// `Pull`
  String get pull {
    return Intl.message(
      'Pull',
      name: 'pull',
      desc: '',
      args: [],
    );
  }

  /// `Shoulder`
  String get shoulder {
    return Intl.message(
      'Shoulder',
      name: 'shoulder',
      desc: '',
      args: [],
    );
  }

  /// `Arm`
  String get arm {
    return Intl.message(
      'Arm',
      name: 'arm',
      desc: '',
      args: [],
    );
  }

  /// `Leg`
  String get Leg {
    return Intl.message(
      'Leg',
      name: 'Leg',
      desc: '',
      args: [],
    );
  }

  /// `Push Excercise`
  String get pushex {
    return Intl.message(
      'Push Excercise',
      name: 'pushex',
      desc: '',
      args: [],
    );
  }

  /// `pull Excercise`
  String get pullex {
    return Intl.message(
      'pull Excercise',
      name: 'pullex',
      desc: '',
      args: [],
    );
  }

  /// `shoulder Excercise`
  String get shoulderex {
    return Intl.message(
      'shoulder Excercise',
      name: 'shoulderex',
      desc: '',
      args: [],
    );
  }

  /// `Arm Excercise`
  String get armex {
    return Intl.message(
      'Arm Excercise',
      name: 'armex',
      desc: '',
      args: [],
    );
  }

  /// `Leg Excercise`
  String get legex {
    return Intl.message(
      'Leg Excercise',
      name: 'legex',
      desc: '',
      args: [],
    );
  }

  /// `Edit Profile`
  String get editprofile {
    return Intl.message(
      'Edit Profile',
      name: 'editprofile',
      desc: '',
      args: [],
    );
  }

  /// `Notifications`
  String get notifications {
    return Intl.message(
      'Notifications',
      name: 'notifications',
      desc: '',
      args: [],
    );
  }

  /// `Social Connect`
  String get socailconnect {
    return Intl.message(
      'Social Connect',
      name: 'socailconnect',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get Language {
    return Intl.message(
      'Language',
      name: 'Language',
      desc: '',
      args: [],
    );
  }

  /// `About App`
  String get aboutapp {
    return Intl.message(
      'About App',
      name: 'aboutapp',
      desc: '',
      args: [],
    );
  }

  /// `contact us`
  String get contactus {
    return Intl.message(
      'contact us',
      name: 'contactus',
      desc: '',
      args: [],
    );
  }

  /// `privacy`
  String get privacy {
    return Intl.message(
      'privacy',
      name: 'privacy',
      desc: '',
      args: [],
    );
  }

  /// `Log out`
  String get logout {
    return Intl.message(
      'Log out',
      name: 'logout',
      desc: '',
      args: [],
    );
  }

  /// `Save Profile`
  String get save {
    return Intl.message(
      'Save Profile',
      name: 'save',
      desc: '',
      args: [],
    );
  }

  /// `Get in Touch`
  String get get {
    return Intl.message(
      'Get in Touch',
      name: 'get',
      desc: '',
      args: [],
    );
  }

  /// `We would love to hear from you! Here’s how you can reach us:`
  String get we {
    return Intl.message(
      'We would love to hear from you! Here’s how you can reach us:',
      name: 'we',
      desc: '',
      args: [],
    );
  }

  /// `Send us a message`
  String get send {
    return Intl.message(
      'Send us a message',
      name: 'send',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get name {
    return Intl.message(
      'Name',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Message`
  String get message {
    return Intl.message(
      'Message',
      name: 'message',
      desc: '',
      args: [],
    );
  }

  /// `Send Message`
  String get Sendmess {
    return Intl.message(
      'Send Message',
      name: 'Sendmess',
      desc: '',
      args: [],
    );
  }

  /// `Privacy Policy`
  String get pri {
    return Intl.message(
      'Privacy Policy',
      name: 'pri',
      desc: '',
      args: [],
    );
  }

  /// `Effective Date: January 1, 2024`
  String get effictive {
    return Intl.message(
      'Effective Date: January 1, 2024',
      name: 'effictive',
      desc: '',
      args: [],
    );
  }

  /// `Introduction`
  String get introduction {
    return Intl.message(
      'Introduction',
      name: 'introduction',
      desc: '',
      args: [],
    );
  }

  /// `Facebook`
  String get facebook {
    return Intl.message(
      'Facebook',
      name: 'facebook',
      desc: '',
      args: [],
    );
  }

  /// `Twitter`
  String get twitter {
    return Intl.message(
      'Twitter',
      name: 'twitter',
      desc: '',
      args: [],
    );
  }

  /// `LinkedIn`
  String get LinkedIn {
    return Intl.message(
      'LinkedIn',
      name: 'LinkedIn',
      desc: '',
      args: [],
    );
  }

  /// `tumblr`
  String get tumblr {
    return Intl.message(
      'tumblr',
      name: 'tumblr',
      desc: '',
      args: [],
    );
  }

  /// `Your Weight Progress`
  String get your_weight_progress {
    return Intl.message(
      'Your Weight Progress',
      name: 'your_weight_progress',
      desc: '',
      args: [],
    );
  }

  /// `Add more photos to track your progress`
  String get add_more_photos {
    return Intl.message(
      'Add more photos to track your progress',
      name: 'add_more_photos',
      desc: '',
      args: [],
    );
  }

  /// `Select Date`
  String get select_date {
    return Intl.message(
      'Select Date',
      name: 'select_date',
      desc: '',
      args: [],
    );
  }

  /// `Enter your weight (kg)`
  String get enter_weight {
    return Intl.message(
      'Enter your weight (kg)',
      name: 'enter_weight',
      desc: '',
      args: [],
    );
  }

  /// `Add`
  String get add_button {
    return Intl.message(
      'Add',
      name: 'add_button',
      desc: '',
      args: [],
    );
  }

  /// `Weight entry deleted`
  String get weight_entry_deleted {
    return Intl.message(
      'Weight entry deleted',
      name: 'weight_entry_deleted',
      desc: '',
      args: [],
    );
  }

  /// `Image deleted`
  String get image_deleted {
    return Intl.message(
      'Image deleted',
      name: 'image_deleted',
      desc: '',
      args: [],
    );
  }

  /// `Rate Your Heart Measure`
  String get appTitle {
    return Intl.message(
      'Your Heart Measure Rate',
      name: 'appTitle',
      desc: '',
      args: [],
    );
  }

  /// `Cover both the camera and the flash with your finger`
  String get coverCamera {
    return Intl.message(
      'Cover both the camera and the flash with your finger',
      name: 'coverCamera',
      desc: '',
      args: [],
    );
  }

  /// `Schedule`
  String get schedule_title {
    return Intl.message(
      'Schedule',
      name: 'schedule_title',
      desc: '',
      args: [],
    );
  }

  /// `Stay Hydrated: Drink plenty of water before, during, and after workouts.`
  String get stay_hydrated {
    return Intl.message(
      'Stay Hydrated: Drink plenty of water before, during, and after workouts.',
      name: 'stay_hydrated',
      desc: '',
      args: [],
    );
  }

  /// `Incorporate Strength Training: Aim for at least two sessions per week to build muscle and boost metabolism.`
  String get incorporate_strength_training {
    return Intl.message(
      'Incorporate Strength Training: Aim for at least two sessions per week to build muscle and boost metabolism.',
      name: 'incorporate_strength_training',
      desc: '',
      args: [],
    );
  }

  /// `Warm-Up and Cool Down: Always start your workout with a warm-up and end with a cool-down to prevent injuries.`
  String get warm_up_cool_down {
    return Intl.message(
      'Warm-Up and Cool Down: Always start your workout with a warm-up and end with a cool-down to prevent injuries.',
      name: 'warm_up_cool_down',
      desc: '',
      args: [],
    );
  }

  /// `Get Enough Sleep: Aim for 7-9 hours of quality sleep each night to enhance recovery and performance.`
  String get get_enough_sleep {
    return Intl.message(
      'Get Enough Sleep: Aim for 7-9 hours of quality sleep each night to enhance recovery and performance.',
      name: 'get_enough_sleep',
      desc: '',
      args: [],
    );
  }

  /// `Fuel Your Body: Consume a balanced diet rich in whole foods, lean proteins, healthy fats, and complex carbohydrates.`
  String get fuel_your_body {
    return Intl.message(
      'Fuel Your Body: Consume a balanced diet rich in whole foods, lean proteins, healthy fats, and complex carbohydrates.',
      name: 'fuel_your_body',
      desc: '',
      args: [],
    );
  }

  /// `Set Realistic Goals: Establish achievable short-term and long-term fitness goals to stay motivated.`
  String get set_realistic_goals {
    return Intl.message(
      'Set Realistic Goals: Establish achievable short-term and long-term fitness goals to stay motivated.',
      name: 'set_realistic_goals',
      desc: '',
      args: [],
    );
  }

  /// `Mix Up Your Routine: Incorporate different types of exercises (cardio, strength, flexibility) to avoid boredom and plateaus.`
  String get mix_up_your_routine {
    return Intl.message(
      'Mix Up Your Routine: Incorporate different types of exercises (cardio, strength, flexibility) to avoid boredom and plateaus.',
      name: 'mix_up_your_routine',
      desc: '',
      args: [],
    );
  }

  /// `Track Your Progress: Use a journal or app to log workouts and monitor improvements.`
  String get track_your_progress {
    return Intl.message(
      'Track Your Progress: Use a journal or app to log workouts and monitor improvements.',
      name: 'track_your_progress',
      desc: '',
      args: [],
    );
  }

  /// `Listen to Your Body: Pay attention to your body's signals. If you're feeling fatigued, take a rest day.`
  String get listen_to_your_body {
    return Intl.message(
      'Listen to Your Body: Pay attention to your body\'s signals. If you\'re feeling fatigued, take a rest day.',
      name: 'listen_to_your_body',
      desc: '',
      args: [],
    );
  }

  /// `Incorporate Rest Days: Allow your body to recover by scheduling regular rest days in your routine.`
  String get incorporate_rest_days {
    return Intl.message(
      'Incorporate Rest Days: Allow your body to recover by scheduling regular rest days in your routine.',
      name: 'incorporate_rest_days',
      desc: '',
      args: [],
    );
  }

  /// `Practice Good Form: Focus on your technique to maximize effectiveness and minimize injury risk.`
  String get practice_good_form {
    return Intl.message(
      'Practice Good Form: Focus on your technique to maximize effectiveness and minimize injury risk.',
      name: 'practice_good_form',
      desc: '',
      args: [],
    );
  }

  /// `Consider Professional Guidance: Hiring a personal trainer can provide you with tailored workouts and accountability.`
  String get consider_professional_guidance {
    return Intl.message(
      'Consider Professional Guidance: Hiring a personal trainer can provide you with tailored workouts and accountability.',
      name: 'consider_professional_guidance',
      desc: '',
      args: [],
    );
  }

  /// `Stay Consistent: Make fitness a regular part of your routine for long-term benefits.`
  String get stay_consistent {
    return Intl.message(
      'Stay Consistent: Make fitness a regular part of your routine for long-term benefits.',
      name: 'stay_consistent',
      desc: '',
      args: [],
    );
  }

  /// `Find a Workout Buddy: Exercising with a friend can increase motivation and accountability.`
  String get find_a_workout_buddy {
    return Intl.message(
      'Find a Workout Buddy: Exercising with a friend can increase motivation and accountability.',
      name: 'find_a_workout_buddy',
      desc: '',
      args: [],
    );
  }

  /// `Set a Schedule: Plan your workouts in advance and treat them like important appointments.`
  String get set_a_schedule {
    return Intl.message(
      'Set a Schedule: Plan your workouts in advance and treat them like important appointments.',
      name: 'set_a_schedule',
      desc: '',
      args: [],
    );
  }

  /// `Use Proper Equipment: Invest in good-quality workout gear and equipment to enhance your performance.`
  String get use_proper_equipment {
    return Intl.message(
      'Use Proper Equipment: Invest in good-quality workout gear and equipment to enhance your performance.',
      name: 'use_proper_equipment',
      desc: '',
      args: [],
    );
  }

  /// `Stretch Regularly: Incorporate flexibility exercises to improve range of motion and reduce the risk of injury.`
  String get stretch_regularly {
    return Intl.message(
      'Stretch Regularly: Incorporate flexibility exercises to improve range of motion and reduce the risk of injury.',
      name: 'stretch_regularly',
      desc: '',
      args: [],
    );
  }

  /// `Limit Processed Foods: Focus on whole foods and minimize intake of processed snacks and meals.`
  String get limit_processed_foods {
    return Intl.message(
      'Limit Processed Foods: Focus on whole foods and minimize intake of processed snacks and meals.',
      name: 'limit_processed_foods',
      desc: '',
      args: [],
    );
  }

  /// `Incorporate Cardio: Include aerobic exercises for heart health and fat loss, aiming for at least 150 minutes per week.`
  String get incorporate_cardio {
    return Intl.message(
      'Incorporate Cardio: Include aerobic exercises for heart health and fat loss, aiming for at least 150 minutes per week.',
      name: 'incorporate_cardio',
      desc: '',
      args: [],
    );
  }

  /// `Stay Informed: Keep learning about fitness and health through books, podcasts, or courses.`
  String get stay_informed {
    return Intl.message(
      'Stay Informed: Keep learning about fitness and health through books, podcasts, or courses.',
      name: 'stay_informed',
      desc: '',
      args: [],
    );
  }

  /// `Eat Before Your Workout: Have a small snack that combines carbs and protein to fuel your workout.`
  String get eat_before_your_workout {
    return Intl.message(
      'Eat Before Your Workout: Have a small snack that combines carbs and protein to fuel your workout.',
      name: 'eat_before_your_workout',
      desc: '',
      args: [],
    );
  }

  /// `Manage Stress: Incorporate mindfulness or relaxation techniques to help manage stress and improve overall well-being.`
  String get manage_stress {
    return Intl.message(
      'Manage Stress: Incorporate mindfulness or relaxation techniques to help manage stress and improve overall well-being.',
      name: 'manage_stress',
      desc: '',
      args: [],
    );
  }

  /// `Avoid Comparing Yourself to Others: Focus on your personal progress rather than comparing yourself to other gym-goers.`
  String get avoid_comparing_yourself {
    return Intl.message(
      'Avoid Comparing Yourself to Others: Focus on your personal progress rather than comparing yourself to other gym-goers.',
      name: 'avoid_comparing_yourself',
      desc: '',
      args: [],
    );
  }

  /// `Celebrate Small Wins: Acknowledge and reward yourself for reaching milestones in your fitness journey.`
  String get celebrate_small_wins {
    return Intl.message(
      'Celebrate Small Wins: Acknowledge and reward yourself for reaching milestones in your fitness journey.',
      name: 'celebrate_small_wins',
      desc: '',
      args: [],
    );
  }

  /// `Stay Active Outside the Gym: Incorporate physical activities into your daily routine, such as walking or biking.`
  String get stay_active_outside {
    return Intl.message(
      'Stay Active Outside the Gym: Incorporate physical activities into your daily routine, such as walking or biking.',
      name: 'stay_active_outside',
      desc: '',
      args: [],
    );
  }

  /// `Use a Fitness Tracker: Consider using a fitness tracker to monitor your activity levels and set daily goals.`
  String get use_a_fitness_tracker {
    return Intl.message(
      'Use a Fitness Tracker: Consider using a fitness tracker to monitor your activity levels and set daily goals.',
      name: 'use_a_fitness_tracker',
      desc: '',
      args: [],
    );
  }

  /// `Prioritize Nutrition Around Workouts: Pay special attention to what you eat before and after workouts to optimize performance.`
  String get prioritize_nutrition {
    return Intl.message(
      'Prioritize Nutrition Around Workouts: Pay special attention to what you eat before and after workouts to optimize performance.',
      name: 'prioritize_nutrition',
      desc: '',
      args: [],
    );
  }

  /// `Stay Mindful of Your Mental Health: Exercise is great for mental health; don’t underestimate its positive effects on mood.`
  String get stay_mindful {
    return Intl.message(
      'Stay Mindful of Your Mental Health: Exercise is great for mental health; don’t underestimate its positive effects on mood.',
      name: 'stay_mindful',
      desc: '',
      args: [],
    );
  }

  /// `Join Group Classes: Participating in classes can provide structure and a sense of community.`
  String get join_group_classes {
    return Intl.message(
      'Join Group Classes: Participating in classes can provide structure and a sense of community.',
      name: 'join_group_classes',
      desc: '',
      args: [],
    );
  }

  /// `Adjust Your Plan as Needed: Be flexible with your fitness plan and make adjustments based on your progress and lifestyle changes.`
  String get adjust_your_plan {
    return Intl.message(
      'Adjust Your Plan as Needed: Be flexible with your fitness plan and make adjustments based on your progress and lifestyle changes.',
      name: 'adjust_your_plan',
      desc: '',
      args: [],
    );
  }

  /// `Tips`
  String get tips {
    return Intl.message(
      'Tips',
      name: 'tips',
      desc: '',
      args: [],
    );
  }

  /// `Let's Chat`
  String get lets_chat {
    return Intl.message(
      'Let\'s Chat',
      name: 'lets_chat',
      desc: '',
      args: [],
    );
  }

  /// `Describe this picture`
  String get describe_image {
    return Intl.message(
      'Describe this picture',
      name: 'describe_image',
      desc: '',
      args: [],
    );
  }

  /// `week 1`
  String get week1 {
    return Intl.message(
      'week 1',
      name: 'week1',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
