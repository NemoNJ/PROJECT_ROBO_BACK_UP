import os

from ament_index_python.packages import get_package_share_directory
from launch import LaunchDescription
from launch.actions import IncludeLaunchDescription
from launch.launch_description_sources import PythonLaunchDescriptionSource
from launch_ros.actions import Node

def generate_launch_description():
    # ตั้งชื่อแพ็กเกจที่ถูกต้อง
    package_name = 'ROBOT_PROJECT_VERSION_02'  # ตรวจสอบให้แน่ใจว่ามีแพ็กเกจนี้ใน workspace

    # Include the robot_state_publisher launch file
    rsp = IncludeLaunchDescription(
        PythonLaunchDescriptionSource([
            os.path.join(get_package_share_directory(package_name), 'launch', 'rsp.launch.py')
        ]),
        launch_arguments={'use_sim_time': 'true'}.items()  # ตรวจสอบว่าใช้ได้กับ ROS 2 เวอร์ชันที่คุณใช้งาน
    )

    # Include the Gazebo launch file and specify world file
    gazebo = IncludeLaunchDescription(
        PythonLaunchDescriptionSource([
            os.path.join(get_package_share_directory('gazebo_ros'), 'launch', 'gazebo.launch.py')
        ]),
        launch_arguments={
            'world': os.path.join(get_package_share_directory(package_name), 'worlds', 'World_01.world')
        }.items()  # ตรวจสอบว่าใช้ได้กับ ROS 2 เวอร์ชันที่คุณใช้งาน
    )

    # Run the spawner node
    spawn_entity = Node(
        package='gazebo_ros',
        executable='spawn_entity.py',
        arguments=['-topic', 'robot_description',
                   '-entity', 'my_bot',
                   '-x', '0', '-y', '0.002', '-z', '0.32', '-Y', '1.57'],  # หมุน 180 องศา
        output='screen'
    )

    # Launch all components
    return LaunchDescription([
        rsp,
        gazebo,
        spawn_entity,
    ])
