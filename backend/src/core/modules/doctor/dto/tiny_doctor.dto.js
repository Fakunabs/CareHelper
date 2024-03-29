import { ApiDocument } from 'core/config/swagger.config';
import { SwaggerDocument } from 'packages/swagger';

ApiDocument.addModel('TinyDoctorDto', {
    id: SwaggerDocument.ApiProperty({ type: 'int' }),
    fullname: SwaggerDocument.ApiProperty({ type: 'string' }),
    phone: SwaggerDocument.ApiProperty({ type: 'string' }),
});

export const TinyDoctorDto = data => ({
    id: data.doctorId,
    fullname: data.doctorName,
    phone: data.doctorPhone,
});
