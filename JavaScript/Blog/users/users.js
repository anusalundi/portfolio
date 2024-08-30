//kasutajate andmebaas
const users = [
    {
        id: 1,
        firstName: 'Leo',
        lastName: 'Lammas',
        email: 'leolammas@gmail.com',
        password: 'Leo123',
        role: 'admin',
    },
    {
        id: 2,
        firstName: 'Tiina',
        lastName: 'Teeleht',
        email: 'tiinateeleht@gmail.com',
        password: '$2b$10$gFSZmfxRRcHc1SE5x9NEcO5jgB6ntlUeuzDLDEwFrEptyWXoov8E2',
        role: 'user',
    },
    {
        id: 3,
        firstName: 'Kevin',
        lastName: 'Konn',
        email: 'kevin123@gmail.com',
        password: '$2b$10$ogaqRUN4wUG9UMdLDpuqx.ywYRhc4PA6vs3LEphNKasXl5Ovs70yu',
        role: 'user',
    },
]

module.exports = users;
