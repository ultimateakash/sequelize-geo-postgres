const { DataTypes } = require('sequelize');
const sequelize = require('./connection');

const User = sequelize.define('User', {
    name: {
        type: DataTypes.STRING 
    },
    email: {
        type: DataTypes.STRING 
    }, 
    latitude: {
        type: DataTypes.FLOAT
    },
    longitude: {
        type: DataTypes.FLOAT
    },
    status: {
        type: DataTypes.BOOLEAN 
    }
}, {
    underscored: true
}); 

module.exports = User;

User.addScope('distance', (latitude, longitude, distance, unit = 'km') => {
    const constant = unit == 'km' ? 6371 : 3959;
    const haversine = `(
        ${constant} * acos(
            cos(radians(${latitude}))
            * cos(radians(latitude))
            * cos(radians(longitude) - radians(${longitude}))
            + sin(radians(${latitude})) * sin(radians(latitude))
        )
    )`;
    return {
        attributes: [ 
            [sequelize.literal(haversine), 'distance'],
        ],
        where: sequelize.where(sequelize.literal(haversine), '<=', distance)
    }
}) 
 

module.exports = User;