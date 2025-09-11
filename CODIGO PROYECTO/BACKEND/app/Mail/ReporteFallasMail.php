<?php

namespace App\Mail;

use App\Models\Estudiante;
use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Mail\Mailable;
use Illuminate\Mail\Mailables\Content;
use Illuminate\Mail\Mailables\Envelope;
use Illuminate\Queue\SerializesModels;

class ReporteFallasMail extends Mailable
{
    use Queueable, SerializesModels;

    public $estudiante;
    public $fallas;

    /**
     * Create a new message instance.
     */
    public function __construct($estudiante, $fallas)
    {
        $this->estudiante = $estudiante;
        $this->fallas = $fallas;
    }

    /**
     * Get the message envelope.
     */


    public function envelope(): Envelope
    {
        return new Envelope(
            subject: 'Reporte de Inasistencias',
        );
    }

    /**
     * Get the message content definition.
     */
    public function content(): Content
    {
        return new Content(
            view: 'emails.reporte_fallas',
        );
    }

    /**
     * Get the attachments for the message.
     *
     * @return array<int, \Illuminate\Mail\Mailables\Attachment>
     */
    public function attachments(): array
    {
        return [];
    }
}
