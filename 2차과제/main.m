%드론 객체 선언
droneObj = ryze();

%이륙
takeoff(droneObj);
pause(1);

%roll:왼쪽으로 이동
moveleft(droneObj, 'Distance', 1);
pause(1);

%yaw: 오른쪽으로 45도 회전
turn(droneObj, deg2rad(45));
pause(1);

%pitch:전진
moveforward(droneObj, 'Distance', sqrt(2));
pause(1);

%yaw: 왼쪽으로 45도 회전
turn(droneObj, deg2rad(-45));
pause(1);

%pitch:후진
moveback(droneObj, 'Distance', 1);
pause(1);

%착륙
land(droneObj);