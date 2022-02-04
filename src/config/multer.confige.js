import multer from 'fastify-multer'
import path from 'path'
export const upload = multer({
  //multer settings

  fileFilter: function (req, file, callback) {
    var ext = path.extname(file.originalname)
    if (ext !== '.png' && ext !== '.jpg' && ext !== '.gif' && ext !== '.jpeg') {
      return callback(new Error('Only images are allowed'))
    }
    callback(null, true)
  },
  limits: {
    fileSize: 5 * 1024 * 1024,
  },
}).single('file')
