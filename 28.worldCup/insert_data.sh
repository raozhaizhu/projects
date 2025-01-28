#!/bin/bash

if [[ $1 == "test" ]]; then
    PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
    PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# 清空表并重置序列
$PSQL "DELETE FROM games;"
$PSQL "DELETE FROM teams;"
$PSQL "ALTER SEQUENCE teams_team_id_seq RESTART WITH 1;"
$PSQL "ALTER SEQUENCE games_game_id_seq RESTART WITH 1;"

# 提取所有唯一的队伍名称（忽略标题行）
echo -e "\n~~~提取队伍名称~~~\n"
cut -d ',' -f3,4 games.csv | tail -n +2 | tr ',' '\n' | sort -u | while read name; do
    # 插入每个队伍到teams表
    $PSQL "INSERT INTO teams (name) VALUES ('$name') ON CONFLICT (name) DO NOTHING;"
    echo "插入队伍: $name"
done

# 插入比赛数据
echo -e "\n~~~处理比赛数据~~~\n"
tail -n +2 games.csv | while IFS=',' read -r year round winner opponent winner_goals opponent_goals; do
    # 获取winner和opponent的ID
    winner_id=$($PSQL "SELECT team_id FROM teams WHERE name='$winner';")
    opponent_id=$($PSQL "SELECT team_id FROM teams WHERE name='$opponent';")
    echo "获取队伍ID: 胜者ID是$winner_id, 败者ID是$opponent_id"

    # 插入比赛记录
    $PSQL "INSERT INTO games (year, round, winner_id, opponent_id, winner_goals, opponent_goals) 
           VALUES ($year, '$round', $winner_id, $opponent_id, $winner_goals, $opponent_goals);"
    echo "已插入比赛: $year 年 $round 轮, $winner vs $opponent"
done

echo -e "\n~~~数据导入完成~~~\n"
