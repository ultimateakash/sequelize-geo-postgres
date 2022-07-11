const sequelize = require('../models/connection');
const User = require('../models/user.model');
const { Op } = require('sequelize');

exports.nearByUsersExample1 = async (req, res) => {
    const latitude = 28.626137;
    const longitude = 79.821602;
    const distance = 1;

    const haversine = `(
        6371 * acos(
            cos(radians(${latitude}))
            * cos(radians(latitude))
            * cos(radians(longitude) - radians(${longitude}))
            + sin(radians(${latitude})) * sin(radians(latitude))
        )
    )`;

    const users = await User.findAll({
        attributes: [
            'id',
            [sequelize.literal(haversine), 'distance'],
        ],
        where: {
            [Op.and]: [
                sequelize.where(sequelize.literal(haversine), '<=', distance),
                { status: true }
            ]
        },
        order: sequelize.col('distance'),
        limit: 5
    });
    return res.json(users)
}

exports.nearByUsersExample2 = async (req, res) => {
    const latitude = 28.626137;
    const longitude = 79.821602;
    const distance = 1;

    const users = await User.scope({
        method: ['distance', latitude, longitude, distance]
    })
        .findAll({
            attributes: [
                'id'
            ],
            where: {
                status: true
            },
            order: sequelize.col('distance'),
            limit: 5
        });
    return res.json(users)
}